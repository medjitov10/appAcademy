class Cat{
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {

    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }

}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");


markov.says("meow", "Ned");

Function.prototype.mybind = function () {
  const fn = this;
  return fn.call(arguments[0], arguments[1], arguments[2]);
};

markov.says.mybind(breakfast, "meow", "Kush");
