-- CreateTable
CREATE TABLE "eleve" (
    "id" SERIAL NOT NULL,
    "prenom" VARCHAR,
    "name" VARCHAR,
    "formation" VARCHAR,
    "date_debut_formation" DATE,
    "date_fin_formation" DATE,
    "id_user" INTEGER,

    CONSTRAINT "eleve_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enseignant" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "id_user" INTEGER,

    CONSTRAINT "enseignant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "matiere" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "description" TEXT,

    CONSTRAINT "matiere_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salle" (
    "id" SERIAL NOT NULL,
    "numero" INTEGER,

    CONSTRAINT "salle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR,
    "password" VARCHAR,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "eleve" ADD CONSTRAINT "eleve_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enseignant" ADD CONSTRAINT "enseignant_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
