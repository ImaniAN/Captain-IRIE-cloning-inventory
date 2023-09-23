<!-- YOU CAN DELETE EVERYTHING IN THIS PAGE -->
<script>
	export let data;
</script>

<div class="container h-full mx-auto flex justify-center items-center">
	<div class="space-y-5">
		<h1 class="h1">Welcome to the Captain IRIE Farms</h1>
		<h1 class="h1">Cloning Inventory Management System!</h1>
		<p>Start by exploring:()</p>
		<ul>
			{#each data.strains as strain}
				<li>{strain.nickname}</li>
			{/each}
		</ul>
	</div>
</div>
