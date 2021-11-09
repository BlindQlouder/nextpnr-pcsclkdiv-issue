

all: top.config top.json

%.json: %.v
	yosys -p "synth_ecp5 -json $@" $< -l top.rtp 

%.config: %.json
	nextpnr-ecp5 --json $< --textcfg $@ --um5g-85k --package CABGA381 --lpf top.lpf --log top.tim


clean:
	rm *.config *.json



