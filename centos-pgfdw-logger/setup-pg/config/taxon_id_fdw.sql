CREATE SERVER www_fdw_server_ncbi_eutil FOREIGN DATA WRAPPER www_fdw
    OPTIONS (uri 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?',
             response_type 'xml', response_deserialize_callback 'ncbi_taxon_deserialize',
             request_serialize_type 'json', request_serialize_callback 'ncbi_taxon_serialize');

CREATE USER MAPPING FOR current_user SERVER www_fdw_server_ncbi_eutil;

CREATE FOREIGN TABLE www_fdw_taxon (
    genus varchar(1024),
    species varchar(1024),
    taxon_id integer

) SERVER www_fdw_server_ncbi_eutil;

CREATE OR REPLACE FUNCTION ncbi_taxon_deserialize(options WWWFdwOptions, response xml)
    RETURNS SETOF www_fdw_taxon AS $$
BEGIN
    RAISE NOTICE 'response parameters: %', response;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ncbi_taxon_serialize(options WWWFdwOptions, quals text, 
                  INOUT url text, INOUT post WWWFdwPostParamters) AS $$

BEGIN
    RAISE NOTICE 'quals paramters: %', quals;
    RAISE NOTICE 'url paramters: %', url;


END;
$$ LANGUAGE plpgsql;


