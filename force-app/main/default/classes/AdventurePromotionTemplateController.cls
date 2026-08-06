/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : AdventurePromotionTemplateController
 * Author          : <Mamta>
 * Created Date    : Aug 5, 2026
 * Last Modified By: <Mamta>
 * Last Modified On: Aug 5, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Aug 5, 2026  │ <Mamta>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class AdventurePromotionTemplateController {

	@AuraEnabled
	public static String generateSocialMediaPosts(String recordId) {
        Map<String, String> idMap = new Map<String, String>();
        idMap.put('id', recordId);
        
        ConnectApi.WrappedValue wrappedVal = new ConnectApi.WrappedValue();
        wrappedVal.value = idMap;

        Map<String, ConnectApi.WrappedValue> inputParams = new Map<String, ConnectApi.WrappedValue>();
        inputParams.put('Input:Adventure_Activity', wrappedVal);
        
        ConnectApi.EinsteinPromptTemplateGenerationsInput generationsInput = 
            new ConnectApi.EinsteinPromptTemplateGenerationsInput();
		generationsInput.additionalConfig = new ConnectApi.EinsteinLlmAdditionalConfigInput();
		generationsInput.additionalConfig.applicationName = 'PromptBuilderPreview';
        generationsInput.inputParams = inputParams;
        generationsInput.isPreview = false;
        
        String promptDeveloperName = 'Adventure_Promotion';
        ConnectApi.EinsteinPromptTemplateGenerationsRepresentation response = 
            ConnectApi.EinsteinLLM.generateMessagesForPromptTemplate(promptDeveloperName, generationsInput);
            
        return response.generations[0].text;
    }
	

}