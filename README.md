# Formal-verification-of-Synchronous-FIFO-
```
OSS CAD Suite⦘ india@india-Lenovo-ideapad-320-15IKB:~/Downloads/yosys$ sby -f fifo.sby 
SBY 10:03:15 [fifo_basic] Removing directory '/home/india/Downloads/yosys/fifo_basic'.
SBY 10:03:15 [fifo_basic] Copy '/home/india/Downloads/yosys/fifo.sv' to '/home/india/Downloads/yosys/fifo_basic/src/fifo.sv'.
SBY 10:03:15 [fifo_basic] engine_0: smtbmc boolector
SBY 10:03:15 [fifo_cover] Removing directory '/home/india/Downloads/yosys/fifo_cover'.
SBY 10:03:15 [fifo_cover] Copy '/home/india/Downloads/yosys/fifo.sv' to '/home/india/Downloads/yosys/fifo_cover/src/fifo.sv'.
SBY 10:03:15 [fifo_cover] engine_0: smtbmc boolector
SBY 10:03:15 [fifo_basic] base: starting process "cd fifo_basic/src; yosys -ql ../model/design.log ../model/design.ys"
SBY 10:03:15 [fifo_cover] base: starting process "cd fifo_cover/src; yosys -ql ../model/design.log ../model/design.ys"
SBY 10:03:15 [fifo_basic] base: fifo.sv:31: Warning: Ignoring call to system task $monitor.
SBY 10:03:15 [fifo_cover] base: fifo.sv:31: Warning: Ignoring call to system task $monitor.
SBY 10:03:15 [fifo_basic] base: Warning: Wire fifo.\ND_start is used but has no driver.
SBY 10:03:15 [fifo_cover] base: Warning: Wire fifo.\ND_start is used but has no driver.
SBY 10:03:15 [fifo_basic] base: finished (returncode=0)
SBY 10:03:15 [fifo_basic] prep: starting process "cd fifo_basic/model; yosys -ql design_prep.log design_prep.ys"
SBY 10:03:15 [fifo_cover] base: finished (returncode=0)
SBY 10:03:15 [fifo_cover] prep: starting process "cd fifo_cover/model; yosys -ql design_prep.log design_prep.ys"
SBY 10:03:15 [fifo_basic] prep: Warning: Wire fifo.\ND_start is used but has no driver.
SBY 10:03:15 [fifo_cover] prep: Warning: Wire fifo.\ND_start is used but has no driver.
SBY 10:03:15 [fifo_basic] prep: finished (returncode=0)
SBY 10:03:15 [fifo_basic] smt2: starting process "cd fifo_basic/model; yosys -ql design_smt2.log design_smt2.ys"
SBY 10:03:15 [fifo_cover] prep: finished (returncode=0)
SBY 10:03:15 [fifo_cover] smt2: starting process "cd fifo_cover/model; yosys -ql design_smt2.log design_smt2.ys"
SBY 10:03:15 [fifo_basic] smt2: finished (returncode=0)
SBY 10:03:15 [fifo_cover] smt2: finished (returncode=0)
SBY 10:03:15 [fifo_basic] engine_0: starting process "cd fifo_basic; yosys-smtbmc -s boolector --presat --unroll --noprogress -t 32  --append 0 --dump-vcd engine_0/trace.vcd --dump-yw engine_0/trace.yw --dump-vlogtb engine_0/trace_tb.v --dump-smtc engine_0/trace.smtc model/design_smt2.smt2"
SBY 10:03:15 [fifo_cover] engine_0: starting process "cd fifo_cover; yosys-smtbmc -s boolector --presat --unroll -c --noprogress -t 20  --append 0 --dump-vcd engine_0/trace%.vcd --dump-yw engine_0/trace%.yw --dump-vlogtb engine_0/trace%_tb.v --dump-smtc engine_0/trace%.smtc model/design_smt2.smt2"
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Solver: boolector
SBY 10:03:15 [fifo_cover] engine_0: ##   0:00:00  Solver: boolector
SBY 10:03:15 [fifo_cover] engine_0: ##   0:00:00  Status: passed
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 0..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 0..
SBY 10:03:15 [fifo_cover] engine_0: finished (returncode=0)
SBY 10:03:15 [fifo_cover] engine_0: Status returned by engine: pass
SBY 10:03:15 [fifo_cover] summary: Elapsed clock time [H:MM:SS (secs)]: 0:00:00 (0)
SBY 10:03:15 [fifo_cover] summary: Elapsed process time [H:MM:SS (secs)]: 0:00:00 (0)
SBY 10:03:15 [fifo_cover] summary: engine_0 (smtbmc boolector) returned pass
SBY 10:03:15 [fifo_cover] summary: engine_0 did not produce any traces
SBY 10:03:15 [fifo_cover] DONE (PASS, rc=0)
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 1..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 1..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 2..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 2..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 3..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 3..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 4..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 4..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 5..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 5..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 6..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 6..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 7..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 7..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 8..
SBY 10:03:15 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 8..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 9..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 9..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 10..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 10..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 11..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 11..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 12..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 12..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assumptions in step 13..
SBY 10:03:16 [fifo_basic] engine_0: ##   0:00:00  Checking assertions in step 13..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:01  Checking assumptions in step 14..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:01  Checking assertions in step 14..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:01  Checking assumptions in step 15..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:01  Checking assertions in step 15..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:02  Checking assumptions in step 16..
SBY 10:03:17 [fifo_basic] engine_0: ##   0:00:02  Checking assertions in step 16..
SBY 10:03:18 [fifo_basic] engine_0: ##   0:00:02  Checking assumptions in step 17..
SBY 10:03:18 [fifo_basic] engine_0: ##   0:00:02  Checking assertions in step 17..
SBY 10:03:19 [fifo_basic] engine_0: ##   0:00:03  Checking assumptions in step 18..
SBY 10:03:19 [fifo_basic] engine_0: ##   0:00:03  Checking assertions in step 18..
SBY 10:03:20 [fifo_basic] engine_0: ##   0:00:05  Checking assumptions in step 19..
SBY 10:03:20 [fifo_basic] engine_0: ##   0:00:05  Checking assertions in step 19..
SBY 10:03:21 [fifo_basic] engine_0: ##   0:00:05  Checking assumptions in step 20..
SBY 10:03:21 [fifo_basic] engine_0: ##   0:00:05  Checking assertions in step 20..
SBY 10:03:23 [fifo_basic] engine_0: ##   0:00:07  Checking assumptions in step 21..
SBY 10:03:23 [fifo_basic] engine_0: ##   0:00:07  Checking assertions in step 21..
SBY 10:03:24 [fifo_basic] engine_0: ##   0:00:09  Checking assumptions in step 22..
SBY 10:03:24 [fifo_basic] engine_0: ##   0:00:09  Checking assertions in step 22..
SBY 10:03:27 [fifo_basic] engine_0: ##   0:00:11  Checking assumptions in step 23..
SBY 10:03:27 [fifo_basic] engine_0: ##   0:00:11  Checking assertions in step 23..
SBY 10:03:30 [fifo_basic] engine_0: ##   0:00:14  Checking assumptions in step 24..
SBY 10:03:30 [fifo_basic] engine_0: ##   0:00:14  Checking assertions in step 24..
SBY 10:03:33 [fifo_basic] engine_0: ##   0:00:18  Checking assumptions in step 25..
SBY 10:03:33 [fifo_basic] engine_0: ##   0:00:18  Checking assertions in step 25..
SBY 10:03:37 [fifo_basic] engine_0: ##   0:00:21  Checking assumptions in step 26..
SBY 10:03:37 [fifo_basic] engine_0: ##   0:00:22  Checking assertions in step 26..
SBY 10:03:44 [fifo_basic] engine_0: ##   0:00:29  Checking assumptions in step 27..
SBY 10:03:44 [fifo_basic] engine_0: ##   0:00:29  Checking assertions in step 27..
SBY 10:03:49 [fifo_basic] engine_0: ##   0:00:33  Checking assumptions in step 28..
SBY 10:03:49 [fifo_basic] engine_0: ##   0:00:34  Checking assertions in step 28..
SBY 10:03:56 [fifo_basic] engine_0: ##   0:00:41  Checking assumptions in step 29..
SBY 10:03:57 [fifo_basic] engine_0: ##   0:00:41  Checking assertions in step 29..
SBY 10:04:04 [fifo_basic] engine_0: ##   0:00:48  Checking assumptions in step 30..
SBY 10:04:04 [fifo_basic] engine_0: ##   0:00:48  Checking assertions in step 30..
SBY 10:04:14 [fifo_basic] engine_0: ##   0:00:59  Checking assumptions in step 31..
SBY 10:04:14 [fifo_basic] engine_0: ##   0:00:59  Checking assertions in step 31..
SBY 10:04:28 [fifo_basic] engine_0: ##   0:01:12  Status: passed
SBY 10:04:28 [fifo_basic] engine_0: finished (returncode=0)
SBY 10:04:28 [fifo_basic] engine_0: Status returned by engine: pass
SBY 10:04:28 [fifo_basic] summary: Elapsed clock time [H:MM:SS (secs)]: 0:01:13 (73)
SBY 10:04:28 [fifo_basic] summary: Elapsed process time [H:MM:SS (secs)]: 0:01:13 (73)
SBY 10:04:28 [fifo_basic] summary: engine_0 (smtbmc boolector) returned pass
SBY 10:04:28 [fifo_basic] summary: engine_0 did not produce any traces
SBY 10:04:28 [fifo_basic] DONE (PASS, rc=0)
⦗OSS CAD Suite⦘ india@india-Lenovo-ideapad-320-15IKB:~/Downloads/yosys$
```
