#
# Digital Marketplace data
#
CUSTOMER_URN_URL=https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/485331/2015-12-14_Customer_URN_list.xlsx
BUYER_DATA_DIR=data/buyer

.PHONY: init test all clean data buyer

all:	flake8 data

data:	buyer

buyer:	cache/urns.tsv bin/buyers.py
	@mkdir -p $(BUYER_DATA_DIR)
	bin/buyers.py cache/urns.tsv

cache/urns.tsv:	cache/urns.xlsx Makefile
	xlsx2csv -s 1 -d 'tab' -e -i -f "%Y-%m-%d" cache/urns.xlsx > $@

cache/urns.xlsx:
	mkdir -p cache
	curl -s $(CUSTOMER_URN_URL) > $@

flake8:
	flake8 bin

test:
	py.test -v

clean:
	find . -name "*.pyc" | xargs rm -f
	find . -name "__pycache__" | xargs rm -rf
	rm -rf cache
	rm -rf data

init:
	pip3 install --upgrade -r requirements.txt
