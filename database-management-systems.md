# Database management systems {#dbms}

Databases are most visible through the software that allows to interact with data: database management system (DBMS) provide controlled access to databases. The purpose of DBMS is to simplify and to secure definition, creation, storage, retrieval, and update of collections of data. This is achieved by limiting interaction with data to a formal database language that hides details of storage, hardware, and algorithms. The most prominent kind of DBMS is relational database management systems (RDBMS) and its Structured Query Language (SQL). Standardization of SQL allows to more or less uniformly manage relation databases in all RDBMS such as Oracle Database, Microsoft SQL Server, MySQL, IBM DB2. Other kinds of databases come with their own database language but the general architecture of DBMS is the same.

## Anatomy of a database management systems

The general architecture of a DBMS conists of the following functional components (figure X).

### Data dictionary {.unnumbered}

The data dictionary contains information about the individual databases stored in the DBMS: it holds [metadata](http://www.isko.org/cyclo/metadata) about databases. In many cases the data dictionary is also stored as databases together with the data it describes, so it can be accessed in the same way.

### Database manager {.unnumbered}

The database manager is the central control unit of a DBMS. It receives commands and queries from external programs and users and controls execution of commands. The task of the database manager is to ensure consistency (by constraints and integrity checks), reliability (by scheduling), and security (by access control).

### Storage engine {.unnumbered}

The storage engine consists of data structures and processes to read and write data in main memory or secondary storage. This includes database indexes for fast access and caches to support parallel processing (transactions) and data recovery. 

### Query engine {.unnumbered}

The query engine translates queries and commands given in the database language into execution plans tha efficiently act on internal data structures of the storage engine.

## Database models {#database-models}

*...not finished yet...*

Important database models include:

* relational databases (relational model)
* object database (object-oriented model)
* graph database
* document-oriented database
* flat-file databases
* data warehouses (star or snowflake schema)

Outdated models, except for very specialized applications, include network
databases (CODASYL) and hierarchical databases (except for file system).

NoSQL broadly refers to all non-relation models. Special kinds of NoSQL
databases for a specialized data types include key-value stores, XML databases,
geospatial databases, and triple stores. The latter often include inference
rules (deductive database). Another special feature found in some DBMS is
versioning (temporal databases).

Other specialized models such as column-oriented databases mostly differ by
implementation to increase performance for their applications. 

Hierarchical file systems and tabular spreadsheets are often used as databases
despite or because of their simplicity. 

## Application

...

Database management system abstracts from operating systems and hardware so applications can focus on data models and content. The abstraction hides physical schema (see data modeling...)

At least in theory choice and maintenance of DBMS can therefore best be hand off to IT departments. 

Relevant for applications: Knowledge of the particular database model and possibility to define and modify databases (access to the data dictionary).

In practice data is also shaped by other aspects of DBMS than its database models:
usability, scripting, APIs, popularity... (example: FileMaker).

In practice levels of abstraction are not clearly separated and depend on each other.

