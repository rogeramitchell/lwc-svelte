<script>
  // import data stores
  // import data stores
	import { storeContacts } from './Stores.js';

  // computed props
  $: numberOfContacts = $storeContacts.length;
</script>
<div>
  <p>
    And then there were {numberOfContacts === 0 ? 'no' : 'some'} contacts...
  </p>
  <ul>
    {#each $storeContacts as contact (contact.Id)}
    <li>
      {contact.Name} • <a id={contact.Id}>Click to change name to 🍕</a>
    </li>
    {/each}
  </ul>
</div>