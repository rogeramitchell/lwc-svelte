<script>
  // imports
  import { createEventDispatcher } from 'svelte';
  const dispatch = createEventDispatcher();

  // props
  export let contacts = [];

  // computed props
  $: numberOfContacts = contacts.length;

  // functions
  let handleClick = event => {
    dispatch('changeNameToPizza', {
      id: event.target.id
    });
  }
</script>

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