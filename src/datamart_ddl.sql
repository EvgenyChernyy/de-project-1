CREATE TABLE analysis.dm_rfm_segments (
	user_id int4 NOT NULL,
	recency int4 NOT NULL,
	frequency int4 NOT NULL,
	monetary_value int4 NOT NULL,
	CONSTRAINT dm_rfm_segments_frequency_check CHECK (frequency in (1,2,3,4,5)),
	CONSTRAINT dm_rfm_segments_monetary_value_check CHECK (monetary_value in (1,2,3,4,5)),
	CONSTRAINT dm_rfm_segments_recency_check CHECK (recency in (1,2,3,4,5)),
	CONSTRAINT dm_rfm_segments_user_id UNIQUE (user_id)
);
