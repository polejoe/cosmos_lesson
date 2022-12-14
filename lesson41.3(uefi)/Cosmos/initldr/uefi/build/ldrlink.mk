include uefibuidcmd.mk
include ldrobjs.mh
.PHONY : all everything build_kernel
all: build_kernel 
#INITLDR objcopy --only-keep-debug foo foo.dbg
build_kernel:everything build_bin build_dbg
everything : $(INITLDRIMH_ELF) $(INITLDRKRL_ELF) $(INITLDRSVE_ELF)
build_bin:$(INITLDRIMH) $(INITLDRKRL) $(INITLDRSVE)
build_dbg: $(INITLDRIMH_DBG) $(INITLDRKRL_DBG) $(INITLDRSVE_DBG) 

$(INITLDRIMH_ELF): $(INITLDRIMH_LINK)
	$(LD) $(LDRIMHLDFLAGS) -o $@ $(INITLDRIMH_LINK)
$(INITLDRKRL_ELF): $(INITLDRKRL_LINK)
	$(LD) $(LDRKRLLDFLAGS) -o $@ $(INITLDRKRL_LINK)
$(INITLDRSVE_ELF): $(INITLDRSVE_LINK)
	$(LD) $(LDRSVELDFLAGS) -o $@ $(INITLDRSVE_LINK)
$(INITLDRIMH):$(INITLDRIMH_ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@
	@echo 'OBJCOPY -[M] 正在构建...' $@  
$(INITLDRKRL):$(INITLDRKRL_ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@
	@echo 'OBJCOPY -[M] 正在构建...' $@ 
$(INITLDRSVE):$(INITLDRSVE_ELF)
	$(OBJCOPY) $(OJCYFLAGS) $< $@
	@echo 'OBJCOPY -[M] 正在构建...' $@ 
%.debug:%.elf
	$(OBJCOPY) --only-keep-debug $< $@
	@echo 'OBJCOPY -[M] 正在构建...' $@ 