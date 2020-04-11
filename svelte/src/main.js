import App from './App.svelte';

const target = document.querySelector('div[data-id="svelte-app"]');

const app = replaceContainer(App, {
	target,
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