<script>
  export let contacts = [];
  $: numberOfContacts = contacts.length;
</script>

<p>And then there were some contacts...</p>
<ul>
  {#each contacts as contact (contact.Id)}
  <li>
    {contact.Name}
  </li>
  {/each}
</ul>