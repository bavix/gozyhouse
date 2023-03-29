CREATE TABLE events
(
    `trace_id`       UUID COMMENT 'Idempotency Key',

    `gzy_id`         UUID COMMENT 'Client ID generated on the client side',

    `app_id`         UUID COMMENT 'Application ID',
    `metadata`       String COMMENT 'Any data related to the application',

    `request_url`    String COMMENT 'Link to the page (without query data)',
    `request_query`  String COMMENT 'Query page data',

    `referral_url`   String COMMENT 'Link to the ref.page (without query data)',
    `referral_query` String COMMENT 'Query ref.page data',

    `client_id`      String COMMENT 'The unique identifier of the client.',
    `client_ip`      FixedString(16) COMMENT 'client IP',
    `client_data`    String COMMENT 'Any additional information about the client. For example, all IP addresses from X-forwarded-for',

    `user_agent`     String COMMENT 'Client User Agent',
    `cookies`        String COMMENT 'Cookies from the browser',

    `category`       String COMMENT 'Event category',
    `name`           String COMMENT 'Event name',
    `label`          String COMMENT 'A small description of the event',
    `payload`        String COMMENT 'Additional event data',

    `date`           Date COMMENT 'Event date',
    `datetime`       DateTime('Etc/UTC') COMMENT 'Event datetime'
) ENGINE = MergeTree
    PARTITION BY (toYYYYMM(date), app_id)
    PRIMARY KEY (app_id, trace_id)
    ORDER BY (app_id, trace_id, category, name, datetime)
;
