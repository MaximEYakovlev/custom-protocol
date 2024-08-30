CREATE TABLE "Admin" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "username" varchar(100),
  "password" varchar(255),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "DoctorIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "PatientIndex" (
  "id" serial PRIMARY KEY,
  "skinType_id" int,
  "firstname" varchar(100),
  "surname" varchar(100),
  "birthdate" date,
  "sex" varchar(10),
  "comment" varchar(250),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "SkinTypeIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "ProcedureIndex" (
  "id" serial PRIMARY KEY,
  "name" varchar(100),
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "Treatment" (
  "id" serial PRIMARY KEY,
  "procedureIndex_id" int,
  "doctorIndex_id" int,
  "patientIndex_id" int,
  "pulseIndex_id" int,
  "date" date,
  "total_shots" int,
  "total_energy" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

CREATE TABLE "PulseIndex" (
  "id" serial PRIMARY KEY,
  "spot_size" decimal,
  "fluence_ay" decimal,
  "patient_cooling_temp" decimal,
  "patient_cooling_flow" decimal
);

CREATE TABLE "DoctorIndexPatientIndex" (
  "doctor_id" int,
  "patient_id" int,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now())
);

ALTER TABLE "PatientIndex" ADD FOREIGN KEY ("skinType_id") REFERENCES "SkinTypeIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("procedureIndex_id") REFERENCES "ProcedureIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("doctorIndex_id") REFERENCES "DoctorIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("patientIndex_id") REFERENCES "PatientIndex" ("id");

ALTER TABLE "Treatment" ADD FOREIGN KEY ("pulseIndex_id") REFERENCES "PulseIndex" ("id");

ALTER TABLE "DoctorIndexPatientIndex" ADD FOREIGN KEY ("doctor_id") REFERENCES "DoctorIndex" ("id");

ALTER TABLE "DoctorIndexPatientIndex" ADD FOREIGN KEY ("patient_id") REFERENCES "PatientIndex" ("id");
