<template>
	<div id="buttons" class="text-center">
		<div>
			<chart :chart-data="chartData" />
		</div>
	</div>
</template>
<script>
import chart from "./Chart.vue";
import { netTransactions } from "../../api/netTransactions";
export default {
	data() {
		return {
			chartData: null,
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
