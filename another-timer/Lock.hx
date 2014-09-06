#if neko
typedef Lock = neko.vm.Lock;
#elseif cpp
typedef Lock = cpp.vm.Lock;
#else
#error "No *.vm.Lock for this platform"
#end

