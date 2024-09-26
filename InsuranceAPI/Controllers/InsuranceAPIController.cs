using InsuranceAPI.DbContextService;
using InsuranceAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InsuranceAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InsuranceAPIController : ControllerBase
    {
        private readonly IDbContext _dbContext;
        public InsuranceAPIController(IDbContext dbContext)
        {
                _dbContext = dbContext;
        }
        [HttpGet]
        public List<OutputModel> GetPolicyDatabyPolicyID(int policyID)
        {
            List<OutputModel> lst = new List<OutputModel>();
            if (policyID != null)
            {
                lst = _dbContext.GetInsuranceData(policyID).ToList();
            }
            return lst;
        }
    }
}
