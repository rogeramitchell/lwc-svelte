<script>
	// imports
	import ContactList from './ContactList.svelte';
	
	// props
	export let name = '🍕';
	export let getContacts;
	export let updateContactToPizza;
	let contacts = [];

	// functions
	let handleClick = event => {
		getContacts()
			.then(result => {
				contacts = result;
			})
			.catch(error => console.error(error))
	}

	let handleNameToPizza = event => {
		let contactId = event.detail.id;
		updateContactToPizza({ contactId })
			.then(result => {
				let pizzaContactIndex = contacts.findIndex(contact => contact.Id === contactId);
				let pizzaContact = Object.assign({}, contacts[pizzaContactIndex]);
				pizzaContact.Name = '🍕 🍕';
				contacts[pizzaContactIndex] = pizzaContact;
			})
			.catch(error => console.error(error))
	}

	/*
		it seems like we can't make use of dispatch to publish
		custom  events from child components and handle those
		events with callback functions on the parent components

		so, as an LWC / Locker Service workaround, pass a function
		down from the parent component that acts as a broker
		service to pass events to the appropriate callbacks
	*/
	let eventBroker = event => {
		switch(event.name) {
			case 'changeNameToPizza': 
				handleNameToPizza(event);
				break;
		}
	}
</script>

<main>
	<h1>Hello {name}!</h1>
	<button class="slds-button slds-button--brand" on:click={handleClick}>
		Get Contacts
	</button>
	<ContactList {contacts} {eventBroker} />
</main>

<style>
	main {
		text-align: center;
		margin: 0 auto;
		padding: var(--lwc-varSpacingVerticalMedium,1rem) var(--lwc-varSpacingHorizontalMedium,1rem);
    border-bottom: var(--lwc-borderWidthThin,1px) solid var(--lwc-pageHeaderColorBorder,rgb(221, 219, 218));
    border-radius: var(--lwc-pageHeaderBorderRadius,0.25rem);
    background: var(--lwc-pageHeaderColorBackground,rgb(243, 242, 242));
    background-clip: padding-box;
    box-shadow: var(--lwc-pageHeaderShadow,0 2px 2px 0 rgba(0, 0, 0, 0.10));
    border: var(--lwc-borderWidthThin,1px) solid var(--lwc-pageHeaderColorBorder,rgb(221, 219, 218));
	}

	main h1 {
		font-size: 2rem;
	}
</style>