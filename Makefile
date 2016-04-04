#
# Digital Marketplace data
#
CUSTOMER_URN_URL=https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/485331/2015-12-14_Customer_URN_list.xlsx
BUYER_DATA_DIR=data/buyer

.PHONY: init test all clean data counts

all:	flake8 data

data:	counts buyer

buyer:	cache/urns.tsv bin/buyers.py
	@mkdir -p $(BUYER_DATA_DIR)
	bin/buyers.py cache/urns.tsv

counts:	counts/sectors.tsv counts/organisation-types.tsv

counts/sectors.tsv:	cache/urns.tsv
	@mkdir -p counts
	cut -d'	' -f9 cache/urns.tsv  | sort | uniq -c | sort -rn > $@

counts/organisation-types.tsv:	cache/urns.tsv
	@mkdir -p counts
	cut -d'	' -f10 cache/urns.tsv  | sort | uniq -c | sort -rn > $@

cache/urns.tsv:	cache/urns.xlsx
	xlsx2csv -s 1 -d 'tab' -e -i -f "%Y-%m-%d" cache/urns.xlsx > $@

cache/urns.xlsx:
	mkdir -p cache
	curl -L -s $(CUSTOMER_URN_URL) > $@

flake8:
	flake8 bin

test:
	py.test -v

clean:
	find . -name "*.pyc" | xargs rm -f
	find . -name "__pycache__" | xargs rm -rf
	rm -rf cache
	rm -rf counts
	rm -rf data

init:
	pip3 install --upgrade -r requirements.txt
