const express = require('express')
const { buildSchema } = require("graphql")
const { graphqlHTTP } = require("express-graphql")
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

const app = express()
let schema = buildSchema(`
  type User {
    id: Int!
    email: String
    password: String
    eleve: [Eleve]
    enseignant: [Enseignant]
  }

  type Eleve {
    id: Int!
    prenom: String
    name: String
    formation: String
    date_debut_formation: String
    date_fin_formation: String
    user: User!
  }

  type Enseignant {
    id: Int!
    name: String
    user: User!
  }

  type Matiere {
    id: Int!
    name: String
    description: String
  }

  type Salle {
    id: Int!
    numero: String
  }


  type Query {
    getUser:[User]!
    getUniqueUser (id: Int!) : User

    getEnseignant: [Enseignant]!
    getUniqueEnseignant (id: Int!) : User

    getEleve: [Eleve]!
    getUniqueEleve (id: Int!) : User

    getMatiere: [Matiere]!
    getUniqueMatiere (id: Int!) : Matiere

    getSalle: [Salle]!
    getUniqueSalle (id: Int!) : Salle

  }

  type Mutation {
    createUser(email: String!, password: String!): User!
    updateUser(id: Int!, email: String!, password: String!): User
    deleteUser(id: Int!): [User]

    createEleve(prenom: String!, name: String!, formation: String!, date_debut_formation: String!, date_fin_formation: String!, id_user: Int!): Eleve!
    updateEleve(id: Int!, prenom: String!, name: String!, formation: String!, date_debut_formation: String!, date_fin_formation: String!): Eleve

    createEnseignant(name: String!, id_user: Int!): Enseignant!
    updateEnseignant(id: Int!, name: String!): Enseignant

    createMatiere (name: String!, description: String!): [Matiere]!
    updateMatiere (id: Int!, name: String, description: String): Matiere
    deleteMatiere (id: Int!): [Matiere]

    createSalle (numero: String!): [Salle]!
    updateSalle (id: Int!, numero: String): Salle
    deleteSalle (id: Int!): [Salle]
  }
`)

let root = {
// User
  createUser: ({email, password}) => {
    return prisma.user.create({
      data: {
        email,
        password,
      },
    })
  },
  getUniqueUser : ({id}) => {
    return prisma.user.findUnique({
      where: {
        id,
      },
    })
  },
  getUser : ({}) => {
    return prisma.user.findMany({})
  },
  updateUser : async ({id, email, password}) => {
    return await prisma.user.update({
      where: {
        id: id
      },
      data: {
        email,
        password
      }
    })
  },
  deleteUser : async ({id}) => {
    await prisma.user.delete({
      where: {
        id: id
      },
    })
    return prisma.user.findMany({
      orderBy: {
        id: 'asc'
      }
    })
  },

// Enseignant
  createEnseignant: async ({ name, id_user }) => {
    const enseignant = await prisma.enseignant.create({
      data: {
        name,
        user: {
          connect: {
            id: id_user,
          },
        },
      },
    });
    return [enseignant]
  },
  getEnseignant : ({}) => {
    return prisma.enseignant.findMany({})
  },
  getUniqueEnseignant : ({id}) => {
    return prisma.enseignant.findUnique({
      where: {
        id,
      },
    })
  },
  updateEnseignant: async({}) => {
      return await prisma.enseignant.update({
      where: {
        id: id
      },
      data: {
        email,
        password
      }
    })
  },

// Eleve
  createEleve: async ({ prenom, name, date_debut_formation, date_fin_formation, id_user, formation }) => {
    const eleve = await prisma.eleve.create({
      data: {
        prenom,
        name,
        formation,
        date_debut_formation,
        date_fin_formation,
        user: {
          connect: {
            id: id_user,
          },
        },
      },
      include: {
        user: true,
      },
    });
    return [eleve]
  },
  getEleve : ({}) => {
    return prisma.Eleve.findMany({})
  },
  getUniqueEleve : ({id}) => {
    return prisma.eleve.findUnique({
      where: {
        id,
      },
    })
  },
  updateEleve: async({id, prenom, name}) => {
      return await prisma.Eleve.update({
      where: {
        id: id
      },
      data: {
        prenom,
        name
      }
    })
  },

// Matiere
  getMatiere:  () => {
    return prisma.matiere.findMany({
      orderBy: {
        id: 'asc',
      },
    })
  },
  getUniqueMatiere: ({id}) => {
    return prisma.matiere.findUnique({
      where: {
        id,
      },
    })
  },
  createMatiere: async ({name, description}) => {
    await prisma.matiere.create({
      data: {
        name,
        description,
      },
    })
    return await prisma.matiere.findMany({
      orderBy: {
        id: 'asc'
      }
    })
  },
  updateMatiere : async ({id, name, description}) => {
    return await prisma.matiere.update({
      where: {
        id: id
      },
      data: {
        name,
        description
      }
    })
  },
  deleteMatiere : async ({id}) => {
    await prisma.matiere.delete({
      where: {
        id: id
      },
    })
    return prisma.matiere.findMany({
      orderBy: {
        id: 'asc'
      }
    })
  },


// Salle
  getSalle:  () => {
    return prisma.salle.findMany({
      orderBy: {
        id: 'asc',
      },
    })
  },
  getUniqueSalle: ({id}) => {
    return prisma.salle.findUnique({
      where: {
        id,
      },
    })
  },
  createSalle: async ({numero}) => {
    await prisma.salle.create({
      data: {
        numero
      },
    })
    return await prisma.salle.findMany({
      orderBy: {
        id: 'asc'
      }
    })
  },
  updateSalle : async ({id, numero}) => {
    return await prisma.salle.update({
      where: {
        id: id
      },
      data: {
        numero
      }
    })
  },
  deleteSalle : async ({id}) => {
    await prisma.salle.delete({
      where: {
        id: id
      },
    })
    return prisma.salle.findMany({
      orderBy: {
        id: 'asc'
      }
    })
  },
}

app.use("/", graphqlHTTP({
  schema: schema,
  rootValue: root,
  graphiql: true
}))

app.listen(3000, () => {
  console.log("Le serveur est sur l'adresse http://localhost:3000")
})
