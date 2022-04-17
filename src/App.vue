<template>
	<div id="app">
		<transactions />
	</div>
</template>
<script>
import transactions from "./components/transactions/Common.vue";

export default {
	components: {
		transactions,
	},
	computed: {},
};
</script>
<style>
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}
</style>
