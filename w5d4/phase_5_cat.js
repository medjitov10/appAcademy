function Cat(name, owner){
  this.name = name;
  this.owner = owner;

}


Cat.prototype.cuteStatement = function(){
  return `${this.owner} loves ${this.name}`
}

cat1 = new Cat("osman", "os");

console.log(cat1.cuteStatement());
Cat.prototype.cuteStatement = function(){
  return `every one loves ${this.name}`
}
console.log(cat1.cuteStatement());

cat1.meow = function () {
  return 'purr';
};

console.log(cat1.meow());
