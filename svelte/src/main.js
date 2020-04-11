import App from './App.svelte';

window.mount = (target = document.body, props = {}) => {
	return new App({target, props});
}

export default window.mount();