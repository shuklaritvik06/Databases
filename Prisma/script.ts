import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient({ errorFormat: "pretty", log: ["warn"] });

async function main() {
  await prisma.preference.deleteMany({});
  await prisma.user.deleteMany({});
  const user = await prisma.user.create({
    data: {
      name: "John Doe",
      email: "jdoe@example.com",
      password: "secret",
      userPreferences: {
        create: {
          emailUpdate: true,
        },
      },
    },
    // include: {
    //     userPreferences: true,
    // }
    select: {
      name: true,
      userPreferences: { select: { id: true } },
    },
  });
  const manyUser = await prisma.user.createMany({
    data: [
      {
        name: "Jane Doe",
        email: "jdoe@examples.com",
        password: "secret",
      },
      {
        name: "Jake Doe",
        email: "jdoe@eample.com",
        password: "secret",
      },
      {
        name: "Jame Doe",
        email: "jdoe@exampl.com",
        password: "secret",
      },
      {
        name: "Ja Doe",
        email: "jdoe@examps.com",
        password: "secret",
      },
    ],
  });
  const uniQue = await prisma.user.findUnique({
    where: {
      email: "jdoe@example.com",
    },
  });
  const users = await prisma.user.findMany({
    where: {
      password: "secret",
    },
    select: {
      name: true,
      email: true,
    },
    orderBy: {
      name: "desc",
    },
    // distinct: ["password"],
    skip: 1,
    take: 3,
  });

  console.log(users);
  console.log(uniQue);
  console.log(manyUser);
  console.log(user);

  // const users = await prisma.user.findMany({});
  // console.log(users);
}

main()
  .then(() => console.log("Done"))
  .catch((err) => console.error(err.message))
  .finally(async () => {
    await prisma.$disconnect();
  });

//  where name: { in: []}
//  where name: { notIn: []}
// where name { not: "John Doe" }
// age: {lt: 20}   it can be gt, gte,lte
// where name: {contains: "John"}
// where name: {startsWith: "John"}
// where name: {endsWith: "John"}
// where name: { AND: [{contains: "John"}, {contains: "Doe"}]}