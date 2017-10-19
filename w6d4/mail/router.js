class Router{
  constructor(node, routes){
    this.node = node;
    this.routes = routes;
  }


  start(){
    window.addEventListener("hashchange", () => {
      this.render();
    });
  }

  render(){
    this.node.innerHTML = "";
    const component = this.activeRoute();

    if ( component ) {
      this.node.appendChild(component.render());
    }

  }

  activeRoute(){
    let hashFragment = window.location.hash;
    hashFragment = hashFragment.slice(1, hashFragment.length);
    let component = this.routes[hashFragment];
    return component;
  }
}

module.exports = Router;
