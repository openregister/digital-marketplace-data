# Digital Marketplace register data

Data for the [digital-marketplace-buyer register](http://digital-marketplace-buyer.openregister.org), taken from the
[customer URN list](https://www.gov.uk/guidance/current-crown-commercial-service-suppliers-what-you-need-to-know)
maintained by the [Crown Commercial Service](https://www.gov.uk/government/organisations/crown-commercial-service).

# Building

Use make to build the register shaped data
— we recommend using a [Python virtual environment](http://virtualenvwrapper.readthedocs.org/en/latest/):

    $ mkvirtualenv -p python3 digital-markeplace-data
    $ workon digital-marketplace-data
    $ make init

    $ make

# Licence

The software in this project is covered by LICENSE file.

The data is [© Crown copyright](http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/copyright-and-re-use/crown-copyright/)
and available under the terms of the [Open Government 3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/) licence.
