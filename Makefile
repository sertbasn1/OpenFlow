all: checkmakefiles
	cd src && $(MAKE)

clean: checkmakefiles
	cd src && $(MAKE) clean

cleanall: checkmakefiles
	cd src && $(MAKE) MODE=release clean
	cd src && $(MAKE) MODE=debug clean
	rm -f src/Makefile
	
ifeq ($(MODE), debug)
    DBG_SUFFIX=_dbg
else
    DBG_SUFFIX=
endif
	
INET_PROJ=../../inet
MAKEMAKE_OPTIONS := -f --deep --no-deep-includes -O out -KINET_PROJ=../../inet -I. -I$(INET_PROJ)/src/ -L$$\(INET_PROJ\)/out/$$\(CONFIGNAME\)/src -lINET$(DBG_SUFFIX)

makefiles: makefiles-so

makefiles-so:
	@FEATURE_OPTIONS=$$(opp_featuretool options -f -l -c) && cd src && opp_makemake --make-so $(MAKEMAKE_OPTIONS) $$FEATURE_OPTIONS

makefiles-lib:
	@FEATURE_OPTIONS=$$(opp_featuretool options -f -l -c) && cd src && opp_makemake --make-lib $(MAKEMAKE_OPTIONS) $$FEATURE_OPTIONS

makefiles-exe:
	@FEATURE_OPTIONS=$$(opp_featuretool options -f -l -c) && cd src && opp_makemake $(MAKEMAKE_OPTIONS) $$FEATURE_OPTIONS


checkmakefiles:
	@if [ ! -f src/Makefile ]; then \
	echo; \
	echo '======================================================================='; \
	echo 'src/Makefile does not exist. Please use "make makefiles" to generate it!'; \
	echo '======================================================================='; \
	echo; \
	exit 1; \
	fi
