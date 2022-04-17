<template>
<div class="text-center">
	<div>
		<div>
			<chart :chart-data="chartData" />
		</div>
	</div>
	<div class="h3 text-info">{{ config.network }}</div>
</div>

</template>
<script>
import chart from "./Chart.vue";
import { netTransactions, config } from "../../api/netTransactions";
export default {
	data() {
		return {
			chartData: null,
			config
		};
	},
	components: {
		chart,
	},
	mounted() {
		setInterval(() => {
			netTransactions(3).then((data) => {
				this.chartData = data;
				console.log(data.labels);
			});
		}, 3000);
	},
};
</script>
<style scoped>
#buttons span {
	margin-right: 1rem;
	margin-left: 1rem;
}
</style>
