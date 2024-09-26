using InsuranceAPI.Models;

namespace InsuranceAPI.DbContextService
{
    public interface IDbContext
    {
        List<OutputModel> GetInsuranceData(int PolicyId);
    }
}
