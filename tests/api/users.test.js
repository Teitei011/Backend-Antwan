const request = require('supertest');
const app = require('../../app');

describe('Test the /users endpoint', () => {
  it('Should return 200 OK and a list of users', async () => {
    const response = await request(app).get('/users');
    expect(response.statusCode).toBe(200);
    expect(response.body).toBeInstanceOf(Array);
  });

  it('Should return 201 Created when creating a new user', async () => {
    const response = await request(app)
      .post('/users')
      .send({
        name: 'John Doe',
        email: 'john.doe@example.com',
        password: 'password123'
      });
    expect(response.statusCode).toBe(201);
    expect(response.body).toHaveProperty('_id');
  });
});


describe("GET /users", () => {
  it("should return all users", (done) => {
    request(app)
      .get("/users")
      .expect(200)
      .expect((res) => {
        expect(res.body.users.length).toBeGreaterThan(0);
      })
      .end(done);
  });
});

describe("GET /users/:id", () => {
  it("should return a user by id", (done) => {
    request(app)
      .get(`/users/${id}`)
      .expect(200)
      .expect((res) => {
        expect(res.body.user.name).toBe(userOne.name);
      })
      .end(done);
  });

  it("should return a 404 if user not found", (done) => {
    request(app)
      .get(`/users/${new ObjectID().toHexString()}`)
      .expect(404)
      .end(done);
  });
});

describe("POST /users", () => {
  it("should create a user", (done) => {
    const user = { name: "Test User", email: "testuser@example.com" };
    request(app)
      .post("/users")
      .send(user)
      .expect(200)
      .expect((res) => {
        expect(res.body.user.name).toBe(user.name);
        expect(res.body.user.email).toBe(user.email);
      })
      .end((err) => {
        if (err) {
          return done(err);
        }
        User.findOne({ email: user.email }).then((foundUser) => {
          expect(foundUser).toBeTruthy();
          done();
        });
      });
  });
});

describe("PATCH /users/:id", () => {
  it("should update a user", (done) => {
    const user = { name: "Updated User" };
    request(app)
      .patch(`/users/${id}`)
      .send(user)
      .expect(200)
      .expect((res) => {
        expect(res.body.user.name).toBe(user.name);
      })
      .end(done);
  });
});

describe("DELETE /users/:id", () => {
  it("should remove a user", (done) => {
    request(app)
      .delete(`/users/${id}`)
      .expect(200)
      .expect((res) => {
        expect(res.body.user._id).toBe(id);
      })
      .end((err) => {
        if (err) {
          return done(err);
        }
        User.findById(id).then((user) => {
          expect(user).toBeFalsy();
          done();
        });
      });
  });
});