BINDIRS=sr-client sr-ctrl sr-dnsproxy sr-routed sr-nsd sr-testdns
clean_BINDIRS=$(addprefix clean_,$(BINDIRS))

.PHONY: lib $(BINDIRS)

all: $(BINDIRS)

lib:
	$(MAKE) -C lib

$(BINDIRS): lib
	mkdir -p bin/
	$(MAKE) -C $@

clean: $(clean_BINDIRS)
	$(MAKE) -C lib clean

$(clean_BINDIRS):
	$(MAKE) -C $(patsubst clean_%,%,$@) clean
