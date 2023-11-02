# Minimal Version of Makefile initially copied from:
# https://github.com/pwmarcz/fpga-tools/blob/master/fpga.mk
# Courtesy of @pwmarcz (Paweł Marczewski)

IVERILOG ?= iverilog
GTKWAVE ?= gtkwave

TESTS := $(shell find . -type f -name "*_tb.v")

# Don't delete these
.PRECIOUS: build/%.d

.PHONY: clean
clean:
	rm -rf build/*

build/%.d: %.v
	@mkdir -p $(dir $@)

sim run::
ifeq ($(V),)
	$(error Define target name first, e.g.: make $@ V=myfile)
endif

build/%.vcd: %.v build/%.d
	$(IVERILOG) $(find src -type d | sed 's/^/-I /') -DVCD_FILE=\"build/$(<:.v=.vcd)\" -o $@ $<

.PHONY: run
run:: build/$(V:.v=.vcd)
	./$<

.PHONY: sim
sim:: run
	$(GTKWAVE) build/$(V:.v=.vcd)

.PHONY: test
test::
	@echo "Running tests: $(TESTS)"
	@set -e; \
	for v in $(TESTS); do \
		echo $(MAKE) run V=$$v; \
		$(CHRONIC) $(MAKE) run V=$$v; \
	done; \
	echo "All OK"
