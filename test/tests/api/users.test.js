const chai = require('chai');
const chaiHttp = require('chai-http');
const server = require('../../app');
const mocha = require('mocha')
const should = chai.should();

chai.use(chaiHttp);

describe('Users', () => {
  describe('/GET users', () => {
    it('it should GET all the users', (done) => {
      chai.request(server)
        .get('/users')
        .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('array');
            res.body.length.should.be.eql(0);
          done();
        });
    });
  });

  describe('/POST user', () => {
    it('it should POST a user', (done) => {
      const user = {
        name: "John Doe",
        age: 30,
        dateOfBirth: "1993-03-03",
        height: 170,
        weight: 70
      };

      chai.request(server)
        .post('/users')
        .send(user)
        .end((err, res) => {
            res.should.have.status(200);
            res.body.should.be.a('object');
            res.body.should.have.property('name');
            res.body.should.have.property('age');
            res.body.should.have.property('dateOfBirth');
            res.body.should.have.property('height');
            res.body.should.have.property('weight');
            res.body.name.should.be.a('string');
            res.body.age.should.be.a('number');
            res.body.dateOfBirth.should.be.a('string');
            res.body.height.should.be.a('number');
            res.body.weight.should.be.a('number');
          done();
        });
    });
  });
});

