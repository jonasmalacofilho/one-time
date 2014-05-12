NAME=Metafile to EPS Converter

install:
	cp "$(NAME).ppd" /etc/cups/ppd/
	grep "$(NAME)" /etc/cups/printers.conf || cat "$(NAME).conf" | tee -a /etc/cups/printers.conf
	service cups restart

uninstall:
	echo "To uninstall, use your regular interface (GUI or not) to printer management"
	exit 1
# 	service cups stop
# 	rm -f "/etc/cups/ppd/$(NAME).ppd"
# 	mv /etc/cups/printers.conf temp.printers.conf
# 	grep "$(NAME)" temp.printers.conf && diff --changed-group-format="%<" --unchanged-group-format="" temp.printers.conf "$(NAME).conf" | tee /etc/cups/printers.conf
# 	rm temp.printers.conf
# 	service cups start

.PHONY: install uninstall
