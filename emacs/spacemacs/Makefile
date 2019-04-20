DIR_INSTALL:="~"
DIR_CONFIG:="~/.config/spacemacs"
DIR_BASE:=$(pwd)

define create-dirs
mkdir ${DIR_CONFIG}
endef

define backup-dirs
mv ~/.emacs.d ~/.emacs.d.bak
endef

define ln-files
cd ${DIR_BASE}
ln -s ${DIR_BASE}/.spacemacs ${DIR_INSTALL}/.spacemacs
ln -s ${DIR_BASE}/config/* ${DIR_CONFIG}/
endef

install:
	$(backup-dirs)
	$(create-dirs)
	$(ln-files)
