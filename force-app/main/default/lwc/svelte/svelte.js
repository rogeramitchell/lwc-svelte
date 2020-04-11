import { LightningElement } from 'lwc';
import { loadScript, loadStyle } from 'lightning/platformResourceLoader';

// import Svelte static resource
import svelteApp from '@salesforce/resourceUrl/Svelte';

export default class Svelte extends LightningElement {
  connectedCallback() {
    Promise.all([
      loadScript(this, svelteApp + '/bundle.js'),
      loadStyle(this, svelteApp + '/bundle.css'),
    ])
  }
}