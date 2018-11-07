CREATE DATABASE "dance-scheduler";

ALTER DATABASE "dance-scheduler" OWNER TO postgres;

\connect -reuse-previous=on "dbname='dance-scheduler'"

CREATE TABLE public.comment (
    name character varying(512) NOT NULL,
    comment character varying(5000) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    on_page character varying(127) NOT NULL,
    id bigint NOT NULL
);
ALTER TABLE public.comment OWNER TO postgres;

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.comment_id_seq OWNER TO postgres;
ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


CREATE TABLE public.credential (
    id smallint NOT NULL,
    username character varying(511) NOT NULL,
    password character varying(255) NOT NULL,
    privilege character varying(63) NOT NULL,
    fb_reg boolean NOT NULL
);
ALTER TABLE public.credential OWNER TO postgres;

CREATE SEQUENCE public.credential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.credential_id_seq OWNER TO postgres;
ALTER SEQUENCE public.credential_id_seq OWNED BY public.credential.id;


CREATE TABLE public.event_flow (
    source character varying(255) NOT NULL,
    priority smallint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    username character varying(511) NOT NULL,
    content character varying(5000) NOT NULL,
    id bigint NOT NULL
);
ALTER TABLE public.event_flow OWNER TO postgres;

CREATE SEQUENCE public.event_flow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.event_flow_id_seq OWNER TO postgres;
ALTER SEQUENCE public.event_flow_id_seq OWNED BY public.event_flow.id;


CREATE TABLE public.facebook (
    id character varying(63),
    image character varying(330) NOT NULL,
    name character varying(511) NOT NULL,
    token character varying(2048) NOT NULL,
    role character varying(63) NOT NULL,
    serial_id bigint NOT NULL
);
ALTER TABLE public.facebook OWNER TO postgres;

CREATE SEQUENCE public.facebook_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.facebook_serial_id_seq OWNER TO postgres;
ALTER SEQUENCE public.facebook_serial_id_seq OWNED BY public.facebook.serial_id;


CREATE TABLE public.payment (
    serial_id bigint NOT NULL,
    name character varying(300) NOT NULL,
    year smallint NOT NULL,
    month_list character varying(12) NOT NULL
);
ALTER TABLE public.payment OWNER TO postgres;

CREATE SEQUENCE public.payment_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.payment_serial_id_seq OWNER TO postgres;
ALTER SEQUENCE public.payment_serial_id_seq OWNED BY public.payment.serial_id;


CREATE TABLE public.personal_class (
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(127) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255) NOT NULL,
    serial_id bigint NOT NULL
);
ALTER TABLE public.personal_class OWNER TO postgres;

CREATE SEQUENCE public.personal_class_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.personal_class_serial_id_seq OWNER TO postgres;
ALTER SEQUENCE public.personal_class_serial_id_seq OWNED BY public.personal_class.serial_id;


CREATE TABLE public.timetable (
    serial_id bigint NOT NULL,
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(64) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255) NOT NULL
);
ALTER TABLE public.timetable OWNER TO postgres;

CREATE SEQUENCE public.timetable_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timetable_serial_id_seq OWNER TO postgres;
ALTER SEQUENCE public.timetable_serial_id_seq OWNED BY public.timetable.serial_id;


ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
ALTER TABLE ONLY public.credential ALTER COLUMN id SET DEFAULT nextval('public.credential_id_seq'::regclass);
ALTER TABLE ONLY public.event_flow ALTER COLUMN id SET DEFAULT nextval('public.event_flow_id_seq'::regclass);
ALTER TABLE ONLY public.facebook ALTER COLUMN serial_id SET DEFAULT nextval('public.facebook_serial_id_seq'::regclass);
ALTER TABLE ONLY public.payment ALTER COLUMN serial_id SET DEFAULT nextval('public.payment_serial_id_seq'::regclass);
ALTER TABLE ONLY public.personal_class ALTER COLUMN serial_id SET DEFAULT nextval('public.personal_class_serial_id_seq'::regclass);
ALTER TABLE ONLY public.timetable ALTER COLUMN serial_id SET DEFAULT nextval('public.timetable_serial_id_seq'::regclass);


INSERT INTO public.comment VALUES ('Géza', 'Test comment in DB 2', '2018-05-09 10:00:00', 'time-table', 2);
INSERT INTO public.comment VALUES ('Béla', 'Test comment in DB 1', '2018-11-04 20:32:17.447245', 'time-table', 1);
INSERT INTO public.comment VALUES ('ADMIN', 'Test on personal-classes page', '2018-11-05 14:10:50.287', 'personal-classes', 7);
INSERT INTO public.comment VALUES ('ADMIN', 'Once more', '2018-11-05 14:18:47.486', 'personal-classes', 9);
INSERT INTO public.comment VALUES ('ADMIN', 'Once more', '2018-11-05 14:19:03.535', 'personal-classes', 10);
INSERT INTO public.comment VALUES ('ADMIN', 'jk', '2018-11-05 14:23:45.84', 'time-table', 11);
INSERT INTO public.comment VALUES ('ADMIN', 'sthg', '2018-11-05 14:30:36.158', 'time-table', 12);
INSERT INTO public.comment VALUES ('ADMIN', 'fdgdfg', '2018-11-05 14:30:59.381', 'personal-classes', 13);
INSERT INTO public.comment VALUES ('ADMIN', 'Parameterized query
If you are passing parameters to your queries you will want to avoid string concatenating parameters into the query text directly. This can (and often does) lead to sql injection vulnerabilities. node-postgres supports paramterized queries, passing your query text unaltered as well as your parameters to the PostgreSQL server where the parameters are safely substituted into the query with battle-tested parameter substitution code within the server itself.', '2018-11-05 14:31:59.532', 'personal-classes', 14);
INSERT INTO public.comment VALUES ('ADMIN', 'ffg', '2018-11-05 14:34:50.115', 'personal-classes', 15);
INSERT INTO public.comment VALUES ('ADMIN', 'btn-darkbtn-darkbtn-darkbtn-darkbtn-darkbtn-dark
btn-darkbtn-dark
v
btn-darkbtn-darkbtn-darkbtn-dark', '2018-11-05 14:38:08.241', 'time-table', 16);
INSERT INTO public.comment VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:39:02.977', 'time-table', 17);
INSERT INTO public.comment VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:40:24.575', 'time-table', 18);
INSERT INTO public.comment VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:41:53.478', 'time-table', 19);
INSERT INTO public.comment VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:43:25.742', 'personal-classes', 20);
INSERT INTO public.comment VALUES ('ADMIN', '<script>alert("Torpe buzi")</script>', '2018-11-05 15:17:28.629', 'time-table', 21);
INSERT INTO public.comment VALUES ('ADMIN', 'A random comment on UI', '2018-11-06 18:22:44.627', 'personal-classes', 22);
INSERT INTO public.comment VALUES ('ADMIN', 'fgxjhcjm', '2018-11-06 18:23:46.07', 'personal-classes', 23);
INSERT INTO public.comment VALUES ('ADMIN', 'tjjuztkjztdk', '2018-11-06 18:25:06.343', 'time-table', 24);
INSERT INTO public.comment VALUES ('ADMIN', 'tztuiuir', '2018-11-06 18:26:38.062', 'time-table', 25);
INSERT INTO public.comment VALUES ('ADMIN', 'fgfdgfdgfds old', '2018-11-06 18:48:17.032', 'personal-classes', 26);
INSERT INTO public.comment VALUES ('ADMIN', 'new comment', '2018-11-06 19:50:39.135', 'personal-classes', 27);
INSERT INTO public.comment VALUES ('ADMIN', 'sgrgdf', '2018-11-06 20:06:31.414', 'personal-classes', 28);
INSERT INTO public.comment VALUES ('ADMIN', 'dfgfd', '2018-11-06 20:06:33.915', 'personal-classes', 29);
INSERT INTO public.comment VALUES ('ADMIN', 'dfgfd', '2018-11-06 20:06:36.652', 'time-table', 30);
INSERT INTO public.comment VALUES ('ADMIN', 'zuzuz', '2018-11-06 23:05:22.355', 'time-table', 31);
INSERT INTO public.comment VALUES ('ADMIN', 'hjthjhgj', '2018-11-06 23:06:03.741', 'personal-classes', 32);
INSERT INTO public.comment VALUES ('ADMIN', 'rrr', '2018-11-06 23:06:25.451', 'personal-classes', 33);
INSERT INTO public.comment VALUES ('ADMIN', '--é.é', '2018-11-06 23:07:51.031', 'personal-classes', 34);
INSERT INTO public.comment VALUES ('Dániel Preszl', 'sdgd', '2018-11-06 23:09:38.609', 'personal-classes', 35);
INSERT INTO public.comment VALUES ('Dániel Preszl', 'You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.
You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.', '2018-11-07 08:33:28.905', 'personal-classes', 36);

SELECT pg_catalog.setval('public.comment_id_seq', 36, true);

INSERT INTO public.credential VALUES (1, 'Anita', '07394191A668E62C9108540C12414571275873DB757BFC19EADC8425ED294847', 'ADMIN', false);
INSERT INTO public.credential VALUES (7, 'Danconescu', '50c7e0040bff44406381f6f009cf01243bee88ebda2c59fd2b8ad2a7f2faef6a', 'USER', false);
INSERT INTO public.credential VALUES (10, 'Evita', '2070f725ff1c765b73c498de52bc419377979691f6100de3ed99794aeb40d988', 'USER', false);

SELECT pg_catalog.setval('public.credential_id_seq', 10, true);

INSERT INTO public.event_flow VALUES ('Personal Class : Delete Class', 1, '2018-11-06 19:44:39.898', 'Anita', '{"start":"2018-11-07T08:30:00.000Z","title":"Dani és Ági órázik Csongornál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"id":"2","serial_id":"25","end":"2018-11-07T09:15:00.000Z","cssClass":"","actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}]}', 7);
INSERT INTO public.event_flow VALUES ('Personal Class : New Class', 1, '2018-11-06 19:44:55.404', 'Anita', '{"start":"2018-11-08T08:30:00.000Z","end":"2018-11-08T09:15:00.000Z","title":"Dani és Ági órázik Robinál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"3","cssClass":"","serial_id":"26"}', 8);
INSERT INTO public.event_flow VALUES ('personal-classes : Comment', 0, '2018-11-06 19:50:39.135', 'Anita', 'new comment', 9);
INSERT INTO public.event_flow VALUES ('personal-classes : Comment', 0, '2018-11-06 20:06:33.915', 'Anita', 'dfgfd', 11);
INSERT INTO public.event_flow VALUES ('time-table : Comment', 0, '2018-11-06 20:06:36.652', 'Anita', 'dfgfd', 12);
INSERT INTO public.event_flow VALUES ('Personal Class : New Class', 1, '2018-11-06 20:06:44.621', 'Anita', '{"start":"2018-11-05T10:45:00.000Z","end":"2018-11-05T11:30:00.000Z","title":"dfgfdg órázik Anitánál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"1","cssClass":"","serial_id":"27"}', 13);
INSERT INTO public.event_flow VALUES ('Personal Class : New Class', 1, '2018-11-06 20:06:49.987', 'Anita', '{"start":"2018-11-11T11:30:00.000Z","end":"2018-11-11T12:15:00.000Z","title":"dfgfdg órázik Robinál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"3","cssClass":"","serial_id":"28"}', 14);
INSERT INTO public.event_flow VALUES ('Personal Class : Delete Class', 1, '2018-11-06 20:30:06.942', 'Evita', '{"start":"2018-11-05T10:45:00.000Z","title":"dfgfdg órázik Anitánál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"id":"1","serial_id":"27","end":"2018-11-05T11:30:00.000Z","cssClass":"","actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}]}', 15);
INSERT INTO public.event_flow VALUES ('personal-classes : Comment', 0, '2018-11-06 23:07:51.031', 'Dániel Preszl', '--é.é', 19);
INSERT INTO public.event_flow VALUES ('personal-classes : Comment', 0, '2018-11-06 23:09:38.609', 'Dániel Preszl', 'sdgd', 20);
INSERT INTO public.event_flow VALUES ('Personal Class : New Class', 1, '2018-11-06 23:14:36.585', 'Dániel Preszl', '{"start":"2018-11-07T10:15:00.000Z","end":"2018-11-07T11:00:00.000Z","title":"Dániel Preszl órázik Anitánál","color":{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"},"actions":[{"label":"<img class=\"svg-tool-icon\" src=\"../../assets/svg/si-glyph-trash.svg\">"}],"id":"1","cssClass":"","serial_id":"29"}', 21);
INSERT INTO public.event_flow VALUES ('personal-classes : Comment', 0, '2018-11-07 08:33:28.905', 'Dániel Preszl', 'You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.
You can provide multiple callback functions that behave just like middleware, except that these callbacks can invoke next(''route'') to bypass the remaining route callback(s). You can use this mechanism to impose pre-conditions on a route, then pass control to subsequent routes if there is no reason to proceed with the current route.', 22);
INSERT INTO public.event_flow VALUES ('personal-classes : New Class', 2, '2018-11-06 19:50:39.135', 'Anita', '{"date": "2018-11-16T10:45:00.000Z", "event": "Federico 2 órás közös standard edzést tart"}', 16);
INSERT INTO public.event_flow VALUES ('personal-classes : New Class', 2, '2018-11-06 19:50:39.135', 'Anita', '{"date": "2018-10-16T10:45:00.000Z", "event": "Federico 2 órás közös standard edzést tart"}', 10);

SELECT pg_catalog.setval('public.event_flow_id_seq', 22, true);

INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBABgvz1WIMkYHPFz1LI4zpcQZBXnOLmqLKteo2xskPZCck8oLGAzskBDbx6MUKIIZBVOTvxq7NaCoFa0htBkbx8PmsNC627nifuCmuxmZBBZCJnMgqfkbfVLZCitX23hHrbjGDdBqzPV7EggyboQ6KLlqNQ1hVo6OMi0nrxZBtNI2JO38RUfdUqBUi1aPQoEngZDZD', 'USER', 1);
INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBADZCBhWcqRsScNg7XOJZA3461L38hnM15JRljI3uAUFZASGHNLpvJA38iA08siCcBBx5iv4iVES1kfmV6A8vE1m8I3Ptif94d67MsQTMJP8D72jxENI5OBmyq6PZB9yAhLZAnXQpGr7QdZAY0hVZCCy3D9PIaMKxO3ZC963LFsKU8TdV2qZBK64jDwyPPloVUMwZDZD', 'USER', 2);
INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBAOAlpEY2kzsPxIyJtliZCuWqYC942ZB1tb6iEpRZCXZC9LxQd8t94sHUTUNKlmKuOTXIwK4yVHr69PMJYShZAO96BbkDY7BeDaYo5pJXB2jGOOSTgZBCU6wSfZBz3HshknVSg0lrejnnoGtoQlsjKgzbxCYbsxxvssUoywYD8ZAzZCZBoZBoaID8f9qft45oiJdiAZDZD', 'USER', 3);
INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBAFZBYythsuJS5hKZB3sQszaC3fiNCtpSskODmd4cqyZA1OrqWSdrdEdq2mvstlUjcf15pI6K7dgcXpyp5cP8tOKlgJCtvVZBmrf7xe6C89qsW2XSf1XFikUUCVkZBLelD3fnF1eubNBFaXmyCCTNlguWDoVe8ei0nHnLEqKhAFSXdsFcqAfr4z1vZAChyxzgZDZD', 'USER', 4);
INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBAL5byCZBiD8zAnQGZA9vLbZAj149tSQZBRWAB9SUysDTbvTEy0ggvzUGJZCXtpcZAYTzHuy6j69BFIhNp37ZCoZB6J8d0FBRSiHisK4nZCneXctwZAvUzyAC90LDaQj60W4AZB8l00yXKQRNIqtLRv12ZAbrQBf1p3xXYpT2jiZAHmCpzLIyTJx7H2aDL6FBMkxTX9wZDZD', 'USER', 5);
INSERT INTO public.facebook VALUES ('2229075060496563', 'https://graph.facebook.com/2229075060496563/picture?type=normal', 'Dániel Preszl', 'EAAZAK2bIUZBccBAJAjlBZA8KTEgNRH5oFu31qnf8PY4Yjbqc0Lxsbma8Vq0ng2JluJTAT72hSW4ZByZCSiZAaGZA7OVnFMsEGmVlw2XZCjc71TXZAhxvtlLo82KFIswcgG9Ak4BZA4geUCvBJ2bfMZAZAGMgUNEVbLhnCymxZChu6lXwkKF2oZASrcYPJr36n9aNk8P5xRPGwStrHgMAZDZD', 'USER', 6);

SELECT pg_catalog.setval('public.facebook_serial_id_seq', 6, true);

INSERT INTO public.payment VALUES (1, 'Dansator DB 1', 2018, 'TTTFFFFFFFFF');

SELECT pg_catalog.setval('public.payment_serial_id_seq', 1, false);

INSERT INTO public.personal_class VALUES ('Tue Nov 06 2018 14:30:00', 'Tue Nov 06 2018 15:15:00', 'Robi és Vivi órázik Robival', '{"primary": "#ffd700", "secondary": "#ffd755"}', '3', 'event-element', 2);
INSERT INTO public.personal_class VALUES ('Mon Nov 05 2018 14:30:00', 'Mon Nov 05 2018 15:15:00', 'Dani és Ági órázik Anitával', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', '1', 'event-element', 1);
INSERT INTO public.personal_class VALUES ('Fri Nov 09 2018 17:15:00', 'Fri Nov 09 2018 18:00:00', 'Máté és Kinga órázik Csongorral', '{"primary": "#6495ed", "secondary": "#6495ff"}', '2', 'event-element', 3);
INSERT INTO public.personal_class VALUES ('2018-11-08T08:30:00.000Z', '2018-11-08T09:15:00.000Z', 'Dani és Ági órázik Robinál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '3', '', 26);
INSERT INTO public.personal_class VALUES ('2018-11-11T11:30:00.000Z', '2018-11-11T12:15:00.000Z', 'dfgfdg órázik Robinál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '3', '', 28);
INSERT INTO public.personal_class VALUES ('2018-11-07T10:15:00.000Z', '2018-11-07T11:00:00.000Z', 'Dániel Preszl órázik Anitánál', '{"primary":"rgba(115, 194, 251, 0.2)","secondary":"rgba(70, 130, 180, 0.2)"}', '1', '', 29);

SELECT pg_catalog.setval('public.personal_class_serial_id_seq', 29, true);

INSERT INTO public.timetable VALUES (1, '[0, 17, 30]', '[0, 18, 30]', 'Erőnléti Kittivel', '{"primary": "#be4a47", "secondary": "#ff4a47"}', 'Erőnléti Kittivel555', 'event-element');
INSERT INTO public.timetable VALUES (2, '[0, 18, 30]', '[0, 19, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés465', 'event-element');
INSERT INTO public.timetable VALUES (4, '[2, 17, 30]', '[2, 18, 30]', 'Erőnléti Ádámmal', '{"primary": "#8b3a3a", "secondary": "#cb3a3a"}', 'Erőnléti Ádámmal084', 'event-element');
INSERT INTO public.timetable VALUES (3, '[1, 18, 30]', '[1, 19, 30]', 'Standard Közös óra', '{"primary": "#03396c", "secondary": "#03398f"}', 'Standard Közös óra10185', 'event-element');
INSERT INTO public.timetable VALUES (5, '[2, 18, 30]', '[2, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65465', 'event-element');
INSERT INTO public.timetable VALUES (6, '[3, 17, 30]', '[3, 18, 30]', 'Zumba', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', 'Zumba123', 'event-element');
INSERT INTO public.timetable VALUES (7, '[3, 18, 30]', '[3, 19, 30]', 'Latin Közös óra', '{"primary": "#ffd700", "secondary": "#ffd755"}', 'Latin Közös óra1646', 'event-element');
INSERT INTO public.timetable VALUES (8, '[4, 17, 30]', '[4, 18, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés467', 'event-element');
INSERT INTO public.timetable VALUES (9, '[4, 18, 30]', '[4, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65477', 'event-element');

SELECT pg_catalog.setval('public.timetable_serial_id_seq', 1, false);


ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.credential
    ADD CONSTRAINT credential_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.event_flow
    ADD CONSTRAINT event_flow_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.facebook
    ADD CONSTRAINT facebook_pkey PRIMARY KEY (serial_id);
ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (serial_id);
ALTER TABLE ONLY public.personal_class
    ADD CONSTRAINT personal_class_pkey PRIMARY KEY (serial_id);
ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_end__key UNIQUE (end_);
ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (serial_id);
ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_start_key UNIQUE (start);

