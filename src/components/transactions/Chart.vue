<script>
import { Line, mixins } from "vue-chartjs";
const { reactiveProp } = mixins;

export default {
  extends: Line,
  mixins: [reactiveProp],
  data() {
    return {
      options: {
        responsive: true,
        maintainAspectRatio: false,
        legend:{
          labels:{
            fontSize: 25
          }
        }
      },
    };
  },
  async mounted() {
    this.renderChart(this.chartData, this.options);
  },
};
</script>