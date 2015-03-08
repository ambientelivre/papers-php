SMARTY_VERSION=2.6.26
ADODB_VERSION=490

################################################

SMARTY_BASE=http://www.smarty.net/files
SMARTY_TARBALL=Smarty-$(SMARTY_VERSION).tar.gz

ADODB_TARBALL=adodb$(ADODB_VERSION).tgz
ADODB_DOWNLOAD=http://sourceforge.net/projects/adodb/files/adodb-php-4-and-5/adodb-$(ADODB_VERSION)-for-php/adodb$(ADODB_VERSION).tgz/download

runtime: smarty adodb

smarty:
	[ -e $(SMARTY_TARBALL) ] || wget $(SMARTY_BASE)/$(SMARTY_TARBALL)
	tar xzf $(SMARTY_TARBALL)
	mv Smarty-$(SMARTY_VERSION) smarty

adodb:
	[ -e $(ADODB_TARBALL) ] || wget -O $(ADODB_TARBALL) $(ADODB_DOWNLOAD)
	tar xzf $(ADODB_TARBALL)

clean:
	rm -rf smarty adodb

fullclean: clean
	rm -rf $(SMARTY_TARBALL)
	rm -rf smarty
	rm -rf $(ADODB_TARBALL)
	rm -rf adodb
