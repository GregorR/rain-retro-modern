ALL=\
	rain-retro-modern-2x/xfwm4/title-1-active.xpm \
	rain-retro-modern-dark-2x/xfwm4/title-1-active.xpm \
	rain-retro-modern-3x/xfwm4/title-1-active.xpm \
	rain-retro-modern-dark-3x/xfwm4/title-1-active.xpm \
	rain-retro-modern-4x/xfwm4/title-1-active.xpm \
	rain-retro-modern-dark-4x/xfwm4/title-1-active.xpm

all: $(ALL)

invert/title-1-active.xpm: rain-retro-modern/xfwm4/*
	mkdir -p invert
	( \
		cd rain-retro-modern/xfwm4 ; \
		for i in *.xpm ; \
		do \
			convert $$i -channel RGB -negate ../../invert/$$i ; \
		done \
	)

rain-retro-modern-dark/xfwm4/title-1-active.xpm: invert/title-1-active.xpm darkadd/*
	mkdir -p rain-retro-modern-dark/xfwm4
	( \
		cd invert ; \
		for i in *.xpm ; \
		do \
			if [ -e ../darkadd/$$i ] ; \
			then \
				composite ../darkadd/$$i $$i ../rain-retro-modern-dark/xfwm4/$$i ; \
			else \
				cp $$i ../rain-retro-modern-dark/xfwm4/$$i ; \
			fi ; \
		done \
	)
	cp darkadd/themerc rain-retro-modern-dark/xfwm4/

%-2x/xfwm4/title-1-active.xpm: %/xfwm4/title-1-active.xpm
	./x.sh $* 2

%-3x/xfwm4/title-1-active.xpm: %/xfwm4/title-1-active.xpm
	./x.sh $* 3

%-4x/xfwm4/title-1-active.xpm: %/xfwm4/title-1-active.xpm
	./x.sh $* 4

install:
	cp -R rain-retro-modern* ~/.local/share/themes/

clean:
	rm -rf invert rain-retro-modern-dark rain-retro-modern-*x
