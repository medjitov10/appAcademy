const DomNodeCollection = require('./dom_node_collection.js');

window.$l = argument => {
  switch (typeof(argument)) {
    case "function":
      if(argument instanceof HTMLElement){
        return new DomNodeCollection([argument]);
      } 
  }
};
