create table config
(
 name varchar(64) not null primary key,
 value varchar(1024)
);

create table mst_group
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 primary_group varchar(1024) not null default '',
 is_revenue smallint,
 is_deemedpositive smallint,
 is_reserved smallint,
 affects_gross_profit smallint,
 sort_position int
);

create table mst_ledger
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 alias varchar(256) not null default '',
 is_revenue smallint,
 is_deemedpositive smallint,
 opening_balance decimal(17,2) default 0,
 description varchar(256) not null default '',
 mailing_name varchar(256) not null default '',
 mailing_address varchar(1024) not null default '',
 mailing_state varchar(256) not null default '',
 mailing_country varchar(256) not null default '',
 mailing_pincode varchar(64) not null default '',
 email varchar(256) not null default '',
 it_pan varchar(64) not null default '',
 gstn varchar(64) not null default '',
 gst_registration_type varchar(64) not null default '',
 gst_supply_type varchar(64) not null default '',
 gst_duty_head varchar(16) not null default '',
 tax_rate decimal(9,4) default 0,
 bank_account_holder varchar(256) not null default '',
 bank_account_number varchar(64) not null default '',
 bank_ifsc varchar(64) not null default '',
 bank_swift varchar(64) not null default '',
 bank_name varchar(64) not null default '',
 bank_branch varchar(64) not null default ''
);

create table mst_vouchertype
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 numbering_method varchar(64) not null default '',
 is_deemedpositive smallint,
 affects_stock smallint
);

create table mst_uom
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 formalname varchar(256) not null default '',
 is_simple_unit smallint not null,
 base_units varchar(1024) not null,
 additional_units varchar(1024) not null,
 conversion int not null
);

create table mst_godown
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 address varchar(1024) not null default ''
);

create table mst_stock_group
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default ''
);

create table mst_stock_item
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 alias varchar(256) not null default '',
 uom varchar(1024) not null default '',
 _uom varchar(64) not null default '',
 opening_balance decimal(15,4) default 0,
 opening_rate decimal(15,4) default 0,
 opening_value decimal(17,2) default 0,
 gst_nature_of_goods varchar(1024) default '',
 gst_hsn_code varchar(64) default '',
 gst_taxability varchar(1024) default ''
);

create table mst_cost_category
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 allocate_revenue smallint,
 allocate_non_revenue smallint
);

create table mst_cost_centre
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 name varchar(1024) not null default '',
 parent varchar(1024) not null default '',
 _parent varchar(64) not null default '',
 category varchar(1024) not null default ''
);

create table mst_gst_effective_rate
(
 item varchar(1024) not null default '',
 _item varchar(64) not null default '',
 applicable_from date,
 hsn_description varchar(256) not null default '',
 hsn_code varchar(64) not null default '',
 rate decimal(17,2) not null default 0,
 is_rcm_applicable smallint,
 nature_of_transaction varchar(64) not null default '',
 nature_of_goods varchar(64) not null default '',
 supply_type varchar(64) not null default '',
 taxability varchar(64) not null default ''
);

create table mst_opening_batch_allocation
(
 item varchar(1024) not null default '',
 _item varchar(64) not null default '',
 opening_balance decimal(15,4) default 0,
 opening_rate decimal(15,4) default 0,
 opening_value decimal(17,2) default 0,
 godown varchar(1024) not null default '',
 _godown varchar(64) not null default '',
 manufactured_on date
);

create table mst_opening_bill_allocation
(
 ledger varchar(1024) not null default '',
 _ledger varchar(64) not null default '',
 opening_balance decimal(17,4) default 0,
 bill_date date
);

create table trn_closingstock_ledger
(
 ledger varchar(1024) not null default '',
 _ledger varchar(64) not null default '',
 stock_date date,
 stock_value decimal(17,2) not null default 0
);

create table trn_voucher
(
 guid varchar(64) not null primary key,
 alterid int not null default 0,
 date date not null,
 voucher_type varchar(1024) not null,
 _voucher_type varchar(64) not null default '',
 voucher_number varchar(64) not null default '',
 reference_number varchar(64) not null default '',
 reference_date date,
 narration varchar(4000) not null default '',
 party_name varchar(256) not null,
 _party_name varchar(64) not null default '',
 place_of_supply varchar(256) not null,
 is_invoice smallint,
 is_accounting_voucher smallint,
 is_inventory_voucher smallint,
 is_order_voucher smallint
);

create table trn_accounting
(
 guid varchar(64) not null default '',
 ledger varchar(1024) not null default '',
 _ledger varchar(64) not null default '',
 amount decimal(17,2) not null default 0,
 amount_forex decimal(17,2) not null default 0,
 currency varchar(16) not null default ''
);

create table trn_inventory
(
 guid varchar(64) not null default '',
 item varchar(1024) not null default '',
 _item varchar(64) not null default '',
 quantity decimal(15,4) not null default 0,
 rate decimal(15,4) not null default 0,
 amount decimal(17,2) not null default 0,
 additional_amount decimal(17,2) not null default 0,
 discount_amount decimal(17,2) not null default 0,
 godown varchar(1024),
 _godown varchar(64) not null default '',
 tracking_number varchar(256),
 order_number varchar(256),
 order_duedate date
);

create table trn_cost_centre
(
 guid varchar(64) not null default '',
 ledger varchar(1024) not null default '',
 _ledger varchar(64) not null default '',
 costcentre varchar(1024) not null default '',
 _costcentre varchar(64) not null default '',
 amount decimal(17,2) not null default 0
);

create table trn_bill
(
 guid varchar(64) not null default '',
 ledger varchar(1024) not null default '',
 _ledger varchar(64) not null default '',
 name varchar(1024) not null default '',
 amount decimal(17,2) not null default 0,
 billtype varchar(256) not null default ''
);

create table trn_batch
(
 guid varchar(64) not null default '',
 item varchar(1024) not null default '',
 _item varchar(64) not null default '',
 name varchar(1024) not null default '',
 quantity decimal(15,4) not null default 0,
 amount decimal(17,2) not null default 0,
 godown varchar(1024),
 _godown varchar(64) not null default '',
 destination_godown varchar(1024),
 _destination_godown varchar(64) not null default '',
 tracking_number varchar(1024)
);
