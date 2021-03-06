# TODO: abort the script if anything is in $NETWORK_DIRECTORY/blocks

UTXO_DOWNLOAD_LINK="http://utxosets.blob.core.windows.net/public/utxo-snapshot-bitcoin-testnet-1445586.tar"
# $BITCOIN_DATA_DIR defined in bashrc
NETWORK_DIRECTORY="$BITCOIN_DATA_DIR/testnet3"
TAR_NAME="$(basename $UTXO_DOWNLOAD_LINK)"
TAR_FILE="$BITCOIN_DATA_DIR/$TAR_NAME"


if [ ! -d $NETWORK_DIRECTORY ]; then
    echo "Creating testnet data dir: $NETWORK_DIRECTORY"
    mkdir -p $NETWORK_DIRECTORY;
fi

if [ ! -e $TAR_FILE ]; then
    echo "Downloading $UTXO_DOWNLOAD_LINK to $TAR_FILE"
    wget "$UTXO_DOWNLOAD_LINK" -q --show-progress -O $TAR_FILE
else
    echo "Already downloaded $UTXO_DOWNLOAD_LINK"
fi


echo "Extracting..."
if ! tar -xf "$TAR_FILE" -C "$BITCOIN_DATA_DIR"; then
  echo "Failed extracting, did you turned bitcoin off? (btcpay-down.sh)"
  exit 1
fi

