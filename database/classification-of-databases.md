# Classification of databases {#classification}

Individual databases and database types can be grouped and described according
to multiple criteria.  From the perspective of Knowledge Organization databases
can be classified with a faceted classification of four semantic categories:
domain of application, content type, database model, and implementation. The
categories can roughly be mapped to the RDA/ONIX categories *content* for
domain of application and content type and to *carrier* for database model and
implementation [@RDAONIX2006]. This comparison should be taken with care as
both dimensions are connected [@Green2007]. In particular what is stored in a
database (domain of application) influences how it is structured (content type
and database model) and vice versa.


## Domain of Application {.unnumbered}

The most practical aspect of a database is its intended or its actual use.
Subcategories of this domain include:

  * The **subject area** indicates what principal kind of information is managed
    with the database (e.g. chemical databases, biological databases, 
    financial databases, bibliographical databases, music database...).

  * The **audience or operator** indicates who typically uses the database in
    which ways (e.g. public databases, private databases, government databases,
    decision support systems, collaborative databases...).

  * The **type of access** identifies methods and requirements to use the
    database (e.g. online databases, free databases, commercial databases...).

For instance most library catalogs mainly manage bibliographic metadata. Their
audience includes the general public having read access and selected librarians
having write access.


## Content Type {.unnumbered}

This aspect refers to the type of records or documents stored in a database.
Content types are defined by a common data model or data format that all
individual records must conform to (see [data modeling](#data-modeling)).
Typical database types by content type include:

  * **Document repositories** store
    [documents](http://www.isko.org/cyclo/document)
    such as texts (full-text databases), media files (multimedia databases),
    or other digital objects.

  * **Knowledge bases** store factual statements. This includes
    most numeric databases (big data) and bibliographic databases
    ([metadata](http://www.isko.org/cyclo/metadata)).

  * **Spatial database** store geographical information.

  * **Terminology databases** store units of language and concepts.

Content types mainly dictate how data from databases can be used and combined
in other information systems, independently from technical and organizational
aspects (see [interoperability](http://www.isko.org/cyclo/interoperability)).

  
## Database Model {.unnumbered}

The database model of a database is a fundamental paradigm that influences
how data can best be organized in a database. That is why this aspect of
databases is mostly referred to as *database type*. Popular database models
include relational databases, object database, graph database,
document-oriented database, flat-file database, and data warehouses.

Basic properties of distinct database models are described in section 
[database management systems](#dbms).


## Implementation {.unnumbered}

Technical aspects of databases are more relevant in computer science than
in Knowledge Organization. Nevertheless types of implementation influence
how databases can be used, so implementations play an important role for
instance for usability.

Examples of categories in this facet of database classification include
distributed databases, in-memory databases, and blockchains.

