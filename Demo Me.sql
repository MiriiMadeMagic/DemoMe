CREATE TYPE "job" AS ENUM (
  'A_R',
  'Manager',
  'Admin'
);

CREATE TYPE "status" AS ENUM (
  'pending',
  'accepted',
  'rejected'
);

CREATE TABLE "labels" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "employee_id" integer
);

CREATE TABLE "employees" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL,
  "role" job NOT NULL,
  "company" integer
);

CREATE TABLE "demos" (
  "id" int PRIMARY KEY,
  "artistName" varchar NOT NULL,
  "spotifySC" varchar,
  "submittedTo" int,
  "demoStatus" status DEFAULT 'pending',
  "contact" varchar
);

COMMENT ON TABLE "employees" IS 'Labels have many employees but an 
  employee only works for one label';

ALTER TABLE "labels" ADD FOREIGN KEY ("employee_id") REFERENCES "employees" ("id");

ALTER TABLE "employees" ADD FOREIGN KEY ("company") REFERENCES "labels" ("id");

ALTER TABLE "demos" ADD FOREIGN KEY ("submittedTo") REFERENCES "labels" ("id");
