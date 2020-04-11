import { LightningElement } from 'lwc';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';

// import Svelte static resource
import svelteApp from '@salesforce/resourceUrl/Svelte';

export default class Svelte extends LightningElement {
  hasInitialRender = false;

  renderedCallback() {
    if(this.hasInitialRender) {
      return;
    }
    this.hasInitialRender = true;
    let document = this.template;
    Promise.all([
      loadScript(this, svelteApp + '/bundle.js'),
      loadStyle(this, svelteApp + '/bundle.css')
    ])
    .then(() => {
      console.log('success');
    })
    .catch(error => console.error(error))
  }
}