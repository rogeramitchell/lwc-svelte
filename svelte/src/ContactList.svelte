<script>
  // imports
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();

  // props
  export let contacts = [];
  export let eventBroker;

  // computed props
  $: numberOfContacts = contacts.length;

  // functions
  function handleClick(event) {
    eventBroker({
      name: 'changeNameToPizza',
      detail: {
        id: event.target.id
      }
    })
  }
</script>
<div>
  <p>
    And then there were {numberOfContacts === 0 ? 'no' : 'some'} contacts...
  </p>
  <ul>
    {#each contacts as contact (contact.Id)}
    <li>
      {contact.Name} • <a id={contact.Id} on:click={handleClick}>Click to change name to 🍕</a>
    </li>
    {/each}
  </ul>
</div>