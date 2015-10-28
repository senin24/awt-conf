create table tests(user_id integer not null, name varchar(256) not null, test_id integer primary key auto_increment not null, deleted integer(1), time integer not null);
create table test_actions(test_id integer not null, type varchar(256) not null, selector varchar(256), data varchar(256), action_id integer not null);
create unique index test_actions_idx on test_actions(test_id, action_id);
create table tasks(user_id integer not null, test_id integer not null, test_name varchar(255) not null, type varchar(256) not null, debug integer(1), status integer not null, node_id varchar(256), result varchar(256), task_id integer primary key auto_increment not null, time integer not null);
create index tasks_idx on tasks(status);
create table task_actions(task_id integer not null, type varchar(256) not null, selector varchar(256), data varchar(256), action_id integer not null, scrn varchar(256), failed varchar(256));
create unique index task_actions_idx on task_actions(task_id, action_id);
create table task_types(type_id integer primary key auto_increment not null, name varchar(256) not null, parent_type_id integer);
create unique index task_types_idx on task_types(name(32));
create table settings(user_id integer primary key not null, email varchar(256), task_fail_email_report integer(1), task_success_email_report integer(1), undeletable integer(1));
create table stats(user_id integer not null, time integer not null, tasks_finished integer not null default 0, tasks_failed integer not null default 0, task_actions_executed integer not null default 0);
create unique index stats_idx on stats(user_id, time);
create table paypal_subscription_actions(id integer primary key not null, cnt integer not null);
create table demo_subscriptions(id integer primary key not null auto_increment, time integer not null, actions_cnt integer not null, user_id integer not null);
create index demo_subscriptions_idx on demo_subscriptions(user_id);
create table users (login varchar(256) not null, passhash varchar(256) not null, id integer primary key auto_increment not null);
create unique index users_idx on users (login(32));
create table task_schedule (start_time integer not null, period_time integer not null, user_key integer, data varchar(1024), id integer primary key auto_increment not null);
create index task_schedule_idx1 on task_schedule(user_key);
create index task_schedule_idx2 on task_schedule(start_time);
create table history(time integer not null, name varchar(256) not null, data varchar(1024), user_key integer, id integer primary key auto_increment not null);
create index history_idx1 on history(user_key);
create index history_idx2 on history(time);
create table mail_schedule (start_time integer not null, period_time integer not null, user_key integer, data varchar(1024), id integer primary key auto_increment not null);
create index mail_schedule_idx1 on mail_schedule(user_key);
create index mail_schedule_idx2 on mail_schedule(start_time);
create table billing_transactions(id integer primary key auto_increment not null, time integer not null, amount_before integer, amount integer, amount_after integer, user_key integer, data varchar(16384));
create index billing_transactions_idx on billing_transactions(time, user_key);
create table billing_accounts(user_key integer primary key, last_transaction_id integer, amount integer not null default 0);
create table paypal_transactions(id integer primary key auto_increment not null, user_key integer, time integer not null, invnum integer not null, amt double, currencycode varchar(4), token varchar(32));
create unique index paypal_transactions_idx1 on paypal_transactions(token);
create index paypal_transactions_idx2 on paypal_transactions(user_key);
create unique index paypal_transactions_idx3 on paypal_transactions(invnum);
create table paypal_subscriptions(id integer primary key auto_increment not null, user_key integer, time integer not null, billingagreementid varchar(32));
create unique index paypal_subscriptions_idx1 on paypal_subscriptions(billingagreementid);
create index paypal_subscriptions_idx2 on paypal_subscriptions(user_key);
create table paypal_log(id integer primary key auto_increment not null, user_key integer, time integer not null, correlationid varchar(32), token varchar(32), invnum integer, data varchar(16384));
create index paypal_log_idx1 on paypal_log(user_key);
create index paypal_log_idx2 on paypal_log(time);
create index paypal_log_idx3 on paypal_log(token);
create index paypal_log_idx4 on paypal_log(correlationid);
create index paypal_log_idx5 on paypal_log(invnum);