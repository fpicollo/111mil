create table person (
	dni                  integer primary key,
	name                 text not null
);

create table log (
	id                   serial primary key,
	timestamp            timestamp with time zone default now(),
	detail               text not null
);


create or replace function person_insert_log_trg()
returns trigger as $$
begin
	insert into log(detail) values('INSERTADO/A ' || NEW.name);
	return NEW;
END;
$$ language plpgsql;

create trigger person_insert_log_trg after insert on person for each row execute procedure person_insert_log_trg();

create or replace function person_delete_log_trg()
returns trigger as $$
begin
	insert into log(detail) values('ELIMINADO/A ' || OLD.name);
	return OLD;
END;
$$ language plpgsql;

create trigger person_delete_log_trg after delete on person for each row execute procedure person_delete_log_trg();