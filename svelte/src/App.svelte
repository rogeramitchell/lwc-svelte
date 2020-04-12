<script>
	export let name = '🍕';
</script>

<main>
	<h1>Hello {name}!</h1>
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