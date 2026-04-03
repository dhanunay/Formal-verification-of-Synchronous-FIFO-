module fifo #(parameter DEPTH=16, DWIDTH=16)
(
        input               	rstn,               // Active low reset
                            	clk,                // Clock
                            	wr_en, 				// Write enable
                            	rd_en, 				// Read enable
        input      [DWIDTH-1:0] din, 				// Data written into FIFO
        output reg [DWIDTH-1:0] dout, 				// Data read from FIFO
        output              	empty, 				// FIFO is empty when high
                            	full 				// FIFO is full when high
);


  reg [$clog2(DEPTH)-1:0]   wptr;
  reg [$clog2(DEPTH)-1:0]   rptr;

  reg [DWIDTH-1 : 0]    fifo[DEPTH];

  always @ (posedge clk) begin
    if (!rstn) begin
      wptr <= 0;
    end else begin
      if (wr_en & !full) begin
        fifo[wptr] <= din;
        wptr <= wptr + 1'b1;
      end
    end
  end

  initial begin
    $monitor("[%0t] [FIFO] wr_en=%0b din=0x%0h rd_en=%0b dout=0x%0h empty=%0b full=%0b",
             $time, wr_en, din, rd_en, dout, empty, full);
  end

  always @ (posedge clk) begin
    if (!rstn) begin
      rptr <= 0;
    end else begin
      if (rd_en & !empty) begin
        dout <= fifo[rptr];
        rptr <= rptr + 1'b1;
      end
    end
  end

  assign full  = (wptr + 1'b1) == rptr;
  assign empty = wptr == rptr;

`ifdef FORMAL

wire ND_start;
reg ND_start_seen,f_past_valid;
reg  [DWIDTH-1:0]       enq_data ;
reg  [$clog2(DEPTH):0]  idx;
wire [$clog2(DEPTH):0]  data_count;
assign data_count = (wptr >= rptr) ? (wptr-rptr) : (wptr+DEPTH-rptr);
parameter IDLE=1'b0,
          START=1'b1;
reg state;


initial begin 
m_initial_rst: assume (!rstn);
f_past_valid =0;
end 

always @(posedge clk)
  f_past_valid <= 1'b1;


always @(posedge clk, negedge rstn)
if(!rstn) ND_start_seen   <= 1'b0;
else if(ND_start) ND_start_seen <= 1'b1;

always @(posedge clk) begin
 //if(f_past_valid)
 //assume( $countones($past(din)^(din)) == 0 );
if(ND_start_seen) m_ND_start: assume (ND_start ==0);
if(state== START) m_wr_en_0 :assume (!wr_en );
end 

always @(posedge clk) begin
if( f_past_valid && $past(rstn) == 0 ) begin 
a_initial_wptr : assert (wptr == 0);

a_initial_rptr : assert (rptr == 0);

a_initial_full : assert  (!full );

a_initial_empty: assert  (empty); 
end  

if( rstn  && $past(rstn)) begin
  //a_full_empty_mutex: assert  ( $countones({full, empty}) != 'd2 );
  a_full_empty_mutex: assert  ( !(full && empty) );

  a_overflow : assert  (wptr <  DEPTH );

  a_rd_addr  : assert ( rptr == 0	|| 
    		        rptr == $past(rptr) ||
  			rptr == $past(rptr)+1'b1
  			);	
  
  a_wr_addr : assert (   wptr == 0	|| 
    			 wptr == $past(wptr) ||
  			 wptr == $past(wptr)+1'b1
  			);	
  
  if((wptr + 1'b1) == rptr)
  	a_full : assert (full);
  else
  	a_not_full : assert (!full);
  
  if( rptr == wptr)
  	a_empty : assert (empty);
  else
  	a_empty_not : assert (!empty);
end 
end

always @(posedge clk)
if(!rstn)  begin 
state <= IDLE;
 idx <= 0;    enq_data <= 0;
end 
else begin 
case(state)
IDLE : if(!ND_start && !wr_en  )
       state <= IDLE;
       else if(ND_start && wr_en && (!full) ) begin 
        state <= START;
        enq_data <= din; 
	 if(rd_en) idx <= data_count; else idx<= data_count + 1'b1;
       end 
START : if(rd_en && idx>0)    idx <=  idx - 1'b1;
endcase
end  
 
//assert  @(posedge clk   disable iff(!rstn)  idx ==1 && rd_en |=> dout == enq_data );

always @(posedge clk) begin
if(f_past_valid && rstn && $past(rstn))   
   if($past(idx) == 1 &&  $past(rd_en) )
      a_check_data :  assert  (  dout == enq_data);
end 
`endif
endmodule
