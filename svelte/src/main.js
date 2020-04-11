import App from './App.svelte';

const app = replaceContainer(App, {
	target: document.querySelector('div#app'),
	props: {
		name: '🍕'
	}
});

function replaceContainer(Component, options) {
	const frag = document.createDocumentFragment();
	const component = new Component(Object.assign({}, options, {target: frag}));

	options.target.replaceWith(frag);

	return component;
}

export default app;