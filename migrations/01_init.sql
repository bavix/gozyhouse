SET allow_experimental_object_type = 1;

CREATE TABLE events
(
    `trace_id`         UUID COMMENT 'Idempotency Key. Save from meta',

    `app_id`           UUID COMMENT 'Application ID',
    `bind_id`          UUID COMMENT 'Client ID generated on the client side',

    `meta`             Map(LowCardinality(String), String) COMMENT 'Any data related to the application',

    `request_url`      String COMMENT 'Link to the page (without query data)',
    `request_query`    String COMMENT 'Query page data',

    `referral_url`     String COMMENT 'Link to the ref.page (without query data)',
    `referral_query`   String COMMENT 'Query ref.page data',

    `client_id`        Nullable(UUID) COMMENT 'The unique identifier of the client.',
    `client_ipv4`      Nullable(IPv4) COMMENT 'client IPv4',
    `client_ipv6`      Nullable(IPv6) COMMENT 'client IPv6',
    `client_ipv4_list` Array(IPv4) COMMENT 'client ip json array list',
    `client_ipv6_list` Array(IPv6) COMMENT 'client ip json array list',
    `client_data`      Map(LowCardinality(String), String) COMMENT 'Any additional information about the client. For example, all IP addresses from X-forwarded-for',

    `category`         LowCardinality(String) COMMENT 'Event category',
    `name`             String COMMENT 'Event name',
    `label`            String COMMENT 'A small description of the event',
    `payload`          Map(LowCardinality(String), String) COMMENT 'Additional event data',

    `date`             Date COMMENT 'Event date',
    `datetime`         DateTime('Etc/UTC') COMMENT 'Event datetime'
) ENGINE = MergeTree
      PARTITION BY (toYYYYMM(date), app_id)
      PRIMARY KEY (app_id, trace_id)
      ORDER BY (app_id, trace_id, category, name, datetime)
;
